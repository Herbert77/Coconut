import os, sys, json ##导入python模块

def cur_file_dir(): ##获取路径
   path = sys.path[0]
   if os.path.isdir(path):
        return path
   elif os.path.isfile(path):
        return os.path.dirname(path)

def read_file_as_str(file_path):
    # 判断路径文件存在
    if not os.path.isfile(file_path):
        raise TypeError(file_path + " does not exist")

    all_the_text = open(file_path).read()
    # print type(all_the_text)
    return all_the_text

def builder(buidlerType , path, file):

   if builderType == "UITableViewController" or builderType == "CustomTableCell":
      r = open(cur_file_dir() + '/OCTemple/' + '/UITemplate/' + '/UITableViewController/' + path, 'r')
   elif builderType == "UICollectionViewController" or builderType == "CustomCollectionCell":
      r = open(cur_file_dir() + '/OCTemple/' + '/UITemplate/' + '/UICollectionViewController/' + path, 'r')
   d = r.read()
   r.close()

   w = open(cur_file_dir() + '/CoconutIsland/' + unit + file, 'w')
   if builderType == "UITableViewController" or builderType == "CustomTableCell":

      w.write(d.replace("<#Unit#>", unit).replace("<#rootViewController#>", rootViewController).replace("<#propertyInCell#>", propertyInCell).replace("<#addViewsInCell#>", addViewsInCell).replace("<#setLayoutInCell#>", setLayoutInCell).replace("<#getterMethodsInCell#>", getterMethodsInCell).replace("<#usedDelegateInCell#>", usedDelegateInCell).replace("<#usedDelegateInController#>", usedDelegateInController).replace("<#propertyInCellViewModel#>", propertyInCellViewModel))

   elif builderType == "UICollectionViewController" or builderType == "CustomCollectionCell":

      w.write(d.replace("<#Unit#>", unit).replace("<#rootViewController#>", rootViewController).replace("<#propertyInCell#>", propertyInCell).replace("<#addViewsInCell#>", addViewsInCell).replace("<#setLayoutInCell#>", setLayoutInCell).replace("<#getterMethodsInCell#>", getterMethodsInCell).replace("<#usedDelegateInCell#>", usedDelegateInCell).replace("<#usedDelegateInController#>", usedDelegateInController).replace("<#propertyInCellViewModel#>", propertyInCellViewModel).replace("<#usedDelegateInCRView#>", usedDelegateInCRView).replace("<#propertyInCRView#>", propertyInCRView).replace("<#addViewsInCRView#>", addViewsInCRView).replace("<#setLayoutInCRView#>", setLayoutInCRView).replace("<#getterMethodsInCRView#>", getterMethodsInCRView).replace("<#propertyInCRViewViewModel#>", propertyInCRViewViewModel))
      
   w.close()

def getPropertyClassName(propertyClass):

   propertyClassName = ''
   modified = ''

   if propertyClass == 'NSString':
      
      propertyClassName = 'NSString *'
      modified = 'copy'

   elif propertyClass == 'Int':

      propertyClassName = 'Int' 
      modified = 'assign'

   elif propertyClass == 'CGFloat':

      propertyClassName = 'CGFloat'
      modified = 'assign'

   elif propertyClass == 'BOOL':

      propertyClassName = 'BOOL'
      modified = 'assign'

   elif propertyClass == 'NSArray':

      propertyClassName = 'NSArray *'
      modified = 'strong'

   elif propertyClass == 'NSMutableArray':

      propertyClassName = 'NSMutableArray *'
      modified = 'strong'

   elif propertyClass == 'NSDictionary':

      propertyClassName = 'NSDictionary *'
      modified = 'strong'

   elif propertyClass == 'NSMutableNSDictionary':

      propertyClassName = 'NSMutableNSDictionary *'
      modified = 'strong'  

   else:
      propertyClassName = value
      modified = 'strong'

   return propertyClassName, modified


file_json = open(cur_file_dir() + "/Config.json", "r") ##打开JSON的配置表
data_json = json.loads(file_json.read()) ##读取配置表中的数据


builderType = str(data_json["BuilderType"])
unit = str(data_json["Unit"])
rootViewController = str(data_json["rootViewController"])

if builderType == "UITableViewController" or builderType == "CustomTableCell":

   propertyInCell = ''
   addViewsInCell = ''
   setLayoutInCell = ''
   getterMethod = ''
   getterMethodsInCell = ''
   usedDelegateInCell = ''
   usedDelegateInController = ''
   propertyInCellViewModel = ''

   for propertyName in data_json["subviewsInCell"]:
      
      propertyClass = data_json["subviewsInCell"][propertyName]

      propertyClassName = propertyClass

      propertyInCell += "@property (strong, nonatomic) " + str(propertyClassName) + " *" + str(propertyName) + ";" + "\n"

      addViewsInCell += "\n    " + "[self.contentView addSubview:self." + str(propertyName) + "];"

      setLayoutInCell += "\n    " + "[self." + str(propertyName) + " mas_makeConstraints:^(MASConstraintMaker *make) {<#constraint#>}];"

      getterMethod = read_file_as_str(cur_file_dir() + '/OCTemple/' + '/Getter/' + str(propertyClassName))

      getterMethod = getterMethod.replace("@clipboard", str(propertyName))

      getterMethodsInCell += getterMethod + "\n" 


   for propertyName in data_json["propertyInCellViewModel"]:
      
      propertyClass = data_json["propertyInCellViewModel"][propertyName]
      
      propertyClassName = ''
      modified = ''

      propertyClassName, modified = getPropertyClassName(propertyClass)

      propertyInCellViewModel += '\n@property (nonatomic,' + modified + ') ' + str(propertyClassName) + str(propertyName) + ';'

   
   cellDelegateArr = data_json["usedDelegateInCell"]

   for index in range(len(cellDelegateArr)):
      if index == 0:
         usedDelegateInCell += '<'

      usedDelegateInCell += cellDelegateArr[index]

      if index == (len(cellDelegateArr)-1):
         usedDelegateInCell += '>'
      else:
         usedDelegateInCell += ", "

   controllerDelegateArr = data_json["usedDelegateInController"]

   for index in range(len(controllerDelegateArr)):
      if index == 0:
         usedDelegateInController += '<'

      usedDelegateInController += controllerDelegateArr[index]

      if index == (len(controllerDelegateArr)-1):
         usedDelegateInController += '>'
      else:
         usedDelegateInController += ", "

   file_json.close()
      

   builder("UITableViewController", "TableViewCell_Template.h", "Cell.h")

   builder("UITableViewController", "TableViewCell_Template.m", "Cell.m")

   builder("UITableViewController", "TableViewCellViewModel_Template.h", "CellViewModel.h")

   builder("UITableViewController", "TableViewCellViewModel_Template.m", "CellViewModel.m")
   
   if builderType == "UITableViewController":

      builder("UITableViewController", "TableViewController_Template.h", "ViewController.h")

      builder("UITableViewController", "TableViewController_Template.m", "ViewController.m")


elif builderType == "UICollectionViewController" or builderType == "CustomCollectionCell":

   propertyInCell = ''
   addViewsInCell = ''
   setLayoutInCell = ''
   getterMethod = ''
   getterMethodsInCell = ''
   usedDelegateInCell = ''
   usedDelegateInController = ''
   propertyInCellViewModel = ''

   for propertyName in data_json["subviewsInCell"]:
   
      propertyClass = data_json["subviewsInCell"][propertyName]

      propertyClassName = propertyClass

      propertyInCell += "@property (strong, nonatomic) " + str(propertyClassName) + " *" + str(propertyName) + ";" + "\n"

      addViewsInCell += "\n    " + "[self.contentView addSubview:self." + str(propertyName) + "];"

      setLayoutInCell += "\n    " + "[self." + str(propertyName) + " mas_makeConstraints:^(MASConstraintMaker *make) {<#constraint#>}];"

      getterMethod = read_file_as_str(cur_file_dir() + '/OCTemple/' + '/Getter/' + str(propertyClassName))

      getterMethod = getterMethod.replace("@clipboard", str(propertyName))

      getterMethodsInCell += getterMethod + "\n" 


   for propertyName in data_json["propertyInCellViewModel"]:
      
      propertyClass = data_json["propertyInCellViewModel"][propertyName]
      
      propertyClassName = ''
      modified = ''

      propertyClassName, modified = getPropertyClassName(propertyClass)

      propertyInCellViewModel += '\n@property (nonatomic,' + modified + ') ' + str(propertyClassName) + str(propertyName) + ';'

   
   cellDelegateArr = data_json["usedDelegateInCell"]
   for index in range(len(cellDelegateArr)):
      if index == 0:
         usedDelegateInCell += '<'

      usedDelegateInCell += cellDelegateArr[index]

      if index == (len(cellDelegateArr)-1):
         usedDelegateInCell += '>'
      else:
         usedDelegateInCell += ", "


   controllerDelegateArr = data_json["usedDelegateInController"]
   for index in range(len(controllerDelegateArr)):
      if index == 0:
         usedDelegateInController += '<'

      usedDelegateInController += controllerDelegateArr[index]

      if index == (len(controllerDelegateArr)-1):
         usedDelegateInController += '>'
      else:
         usedDelegateInController += ", "


   usedDelegateInCRView = ''
   propertyInCRView = ''
   addViewsInCRView = ''
   setLayoutInCRView = ''
   getterMethodsInCRView = ''
   propertyInCRViewViewModel = ''

   usedDelegateInCRViewArr = data_json["usedDelegateInCRView"]
   for index in range(len(usedDelegateInCRViewArr)):
      if index == 0:
         usedDelegateInCRView += '<'

      usedDelegateInCRView += usedDelegateInCRViewArr[index]

      if index == (len(usedDelegateInCRViewArr)-1):
         usedDelegateInCRView += '>'
      else:
         usedDelegateInCRView += ", "


   for propertyName in data_json["propertyInCRView"]:

      propertyClass = data_json["propertyInCRView"][propertyName]

      propertyClassName = propertyClass

      propertyInCRView += "@property (strong, nonatomic) " + str(propertyClassName) + " *" + str(propertyName) + ";" + "\n"

      addViewsInCRView += "\n    " + "[self.contentView addSubview:self." + str(propertyName) + "];"

      setLayoutInCRView += "\n    " + "[self." + str(propertyName) + " mas_makeConstraints:^(MASConstraintMaker *make) {<#constraint#>}];"

      getterMethod = read_file_as_str(cur_file_dir() + '/OCTemple/' + '/Getter/' + str(propertyClassName))

      getterMethod = getterMethod.replace("@clipboard", str(propertyName))

      getterMethodsInCRView += getterMethod + "\n" 


   for propertyName in data_json["propertyInCRViewViewModel"]:
      
      propertyClass = data_json["propertyInCRViewViewModel"][propertyName]
      
      propertyClassName = ''
      modified = ''

      propertyClassName, modified = getPropertyClassName(propertyClass)

      propertyInCRViewViewModel += '\n@property (nonatomic,' + modified + ') ' + str(propertyClassName) + str(propertyName) + ';'


   file_json.close()

   builder("UICollectionViewController", "CollectionViewCell_Template.h", "CollectionViewCell.h")

   builder("UICollectionViewController", "CollectionViewCell_Template.m", "CollectionViewCell.m")

   builder("UICollectionViewController", "CollectionViewCellViewModel_Template.h", "CollectionCellViewModel.h")

   builder("UICollectionViewController", "CollectionViewCellViewModel_Template.m", "CollectionCellViewModel.m")
   
   if builderType == "UICollectionViewController":

      builder("UICollectionViewController", "CollectionViewController_Template.h", "ViewController.h")

      builder("UICollectionViewController", "CollectionViewController_Template.m", "ViewController.m")

      builder("UICollectionViewController", "CollectionViewReusableView_Template.h", "HeaderCRView.h")

      builder("UICollectionViewController", "CollectionViewReusableView_Template.m", "HeaderCRView.m")
      
      builder("UICollectionViewController", "CollectionViewReusableViewViewModel_Template.h", "HeaderCRViewViewModel.h")

      builder("UICollectionViewController", "CollectionViewReusableViewViewModel_Template.m", "HeaderCRViewViewModel.m")

else:

   print("No file is created.")
