# basic_layout

### 布局
- 基础布局
  - Row 行
  - Column 列
  - ListView 下拉
- 细节布局
  - Container
  - SizeBox
  - Padding
  - Flexible

## 基础布局

1. 让子元素足够的大 撑满父元素
2. 当确定位置后，子元素按照规定大小显示

``` 
1. 让子元素足够的大 撑满父元素    [没有设定位置  子元素就无限大]

void main() {
  runApp(build());
}

Widget build() {
  return Container(
    width: 200,
    height: 200,
    color: Colors.amber,
  );
}

2. 当确定位置后，子元素按照规定大小显示  [确定位置后 子元素按照规定显示]

void main() {
  runApp(build());
}

Widget build() {
  return Center(
    child: Container(
      width: 200,
      height: 200,
      color: Colors.amber,
    ),
  );
}
```

### 基础脚手架
- MaterialApp
- CupertinoApp  

``` 
const MaterialApp({
  Key key,
  // 导航键 , key的作用提高复用性能
  this.navigatorKey,
  // 主页
  this.home,
  // 路由
  this.routes = const <String, WidgetBuilder>{},
  // 初始命名路由
  this.initialRoute,
  // 路由构造
  this.onGenerateRoute,
  // 未知路由
  this.onUnknownRoute,
  // 导航观察器
  this.navigatorObservers = const <NavigatorObserver>[],
  // 建造者
  this.builder,
  // APP 标题
  this.title = '',
  // 生成标题
  this.onGenerateTitle,
  // APP 颜色
  this.color,
  // 样式定义
  this.theme,
  // 主机暗色模式
  this.darkTheme,
  // 样式模式
  this.themeMode = ThemeMode.system,
  // 多语言 本地化
  this.locale,
  // 多语言代理
  this.localizationsDelegates,
  // 多语言回调
  this.localeListResolutionCallback,
  this.localeResolutionCallback,
  // 支持的多国语言
  this.supportedLocales = const <Locale>[Locale('en', 'US')],
  // 调试显示材质网格
  this.debugShowMaterialGrid = false,
  // 显示性能叠加
  this.showPerformanceOverlay = false,
  // 检查缓存图片的情况
  this.checkerboardRasterCacheImages = false,
  // 检查不必要的setlayer
  this.checkerboardOffscreenLayers = false,
  // 显示语义调试器
  this.showSemanticsDebugger = false,
  // 显示debug标记 右上角
  this.debugShowCheckedModeBanner = true,
})
```

### Scaffold

``` 
const Scaffold({
    Key key,
    // 菜单栏
    this.appBar,
    // 中间主体内容部分
    this.body,
    // 悬浮按钮
    this.floatingActionButton,
    // 悬浮按钮位置
    this.floatingActionButtonLocation,
    // 悬浮按钮动画
    this.floatingActionButtonAnimator,
    // 固定在下方显示的按钮
    this.persistentFooterButtons,
    // 左侧 侧滑抽屉菜单
    this.drawer,
    // 右侧 侧滑抽屉菜单
    this.endDrawer,
    // 底部菜单
    this.bottomNavigationBar,
    // 底部拉出菜单
    this.bottomSheet,
    // 背景色
    this.backgroundColor,
    // 自动适应底部padding
    this.resizeToAvoidBottomPadding,
    // 重新计算body布局空间大小，避免被遮挡
    this.resizeToAvoidBottomInset,
    // 是否显示到底部，默认为true将显示到顶部状态栏
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.down,
})
```

### Row  水平

``` 
Row({
    Key key,
  	
  	// * 子元素集合
    List<Widget> children = const <Widget>[],
  
    // 主轴方向上的对齐方式（Row的主轴是横向轴）
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
    // 在主轴方向（Row的主轴是横向轴）占有空间的值，默认是max
    MainAxisSize mainAxisSize = MainAxisSize.max,
    // 在交叉轴方向(Row是纵向轴)的对齐方式，Row的高度等于子元素中最高的子元素高度
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.center,
    
 		// 水平方向子元素的排列方向：从左到右排列还是反向
    TextDirection textDirection,
    // 表示纵轴（垂直）的对齐排列方向，默认是VerticalDirection.down，表示从上到下。这个参数一般用于Column组件里
    VerticalDirection verticalDirection = VerticalDirection.down,
    // 字符对齐基线方式
    TextBaseline textBaseline,

})
```

### Column 垂直

宽度等于子元素最大宽度

``` 
Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("aaaaaaaaaaaaaaaaa"),
      Text("aaaaaaaaaa"),
      Text("aaaaa"),
      Text("a"),
    ],
  )
```

### Container 盒模型

Container 默认宽度为 子元素的大小

``` 
class BoxPage extends StatelessWidget {
  const BoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        // color: Colors.amber,

        // Margin(外边距)
        margin: const EdgeInsets.all(50),

        // Padding(内边距)
        padding: const EdgeInsets.all(20),

        // Content(内容)
        child: const Text("我是内容"),

        // 装饰样式
        decoration: BoxDecoration(
          // 背景色
          color: Colors.amber,

          // 边框
          border: Border.all(
            color: Colors.red,
            width: 10,
          ),
        ),
      ),
    );
  }
}

Container(
    // color: Colors.amber,
    width: 300,
    height: 200,
    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
    child: Text("Container"),
    alignment: Alignment.center,

    // 容器的修饰
    decoration: BoxDecoration(
      color: Colors.amber,
      border: Border.all(color: Colors.blue, width: 5),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
            color: Colors.black, offset: Offset(0, 0), blurRadius: 2),
        BoxShadow(
            color: Colors.red, offset: Offset(3, 3), blurRadius: 2),
      ],

      // 背景img
      image: const DecorationImage(
          image: NetworkImage("https://via.placeholder.com/600/92c952"), fit: BoxFit.cover),
    ),

    // 前景装饰
    foregroundDecoration: BoxDecoration(
      color: Colors.red.withOpacity(0.3), // 透明度
    ),

    // 转换
    transform: Matrix4.rotationZ(0.3), // 转换

    // 约束
    constraints: const BoxConstraints(
      minHeight: 100,
      maxHeight: 500,
    ),
  )
```

### ListView 

API: `http://jsonplaceholder.typicode.com/photos?_start=0&_limit=5`

``` 
  @override
  Widget build(BuildContext context) {
    return loding
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            child: ListView.builder(
                itemCount: photos.length,
                // itemExtent: 100,
                itemBuilder: (BuildContext context, int index) {
                  return pho(photos[index].url!, photos[index].title!,
                      photos[index].thumbnailUrl!);
                }),
          );
  }
```

无限下拉刷新用到 pull_to_refresh 第三方组件

### 弹性布局 Flex

- `Expanded` 获取剩余全部空间

``` 
Expanded(
    child: Container(
      width: 100,
      height: 100,
      color: Colors.cyan,
    ),
  ),
  FlutterLogo(
    size: 100,
  )
  
  
  Expanded(
      child: FlutterLogo(
        size: 100,
      ),
      flex: 1,   // 参数占用比例
    )
```

- `const Spacer()` 解除 flex 比例限制

``` 
child: Row(
    children: [
      Expanded(
        flex: 2,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.cyan,
        ),
      ),
      const Spacer(),
      Expanded(
        child: FlutterLogo(
          size: 100,
        ),
        flex: 1,
      )
    ],
  ),
```

### 层叠布局 Stack

- `Stack`
- `Positioned` 绝对定位

``` 
Stack(
    alignment: Alignment.center,
    clipBehavior: Clip.none, // 绝对定位超出部分是否裁切
    children: [
      Container(
        color: Colors.amber,
        width: 300,
        height: 300,
      ),
      Container(
        color: Colors.blue.shade50,
        width: 200,
        height: 200,
      ),
      Container(
        color: Colors.green,
        width: 100,
        height: 100,
      ),

      // 绝对定位
      Positioned(
          left: 230,
          top: 10,
          child: FlutterLogo(
            size: 120,
          ))
    ],
  );
```

### 流式布局 Wrap

``` 
class WrapPage extends StatelessWidget {
  const WrapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween, // 对其方式
        spacing: 3, // 间距 水平
        runSpacing: 3, // 垂直
        children: [
          card(),
          card(),
          card(),
          card()
        ],
      ),
    );
  }
}
```

### 对齐定位 Align

- Align

```
Align({
  Key key,
  
  // 需要一个AlignmentGeometry类型的值
  // AlignmentGeometry 是一个抽象类，
  // 它有两个常用的子类：Alignment和 FractionalOffset
  this.alignment = Alignment.center,
  
  // 两个缩放因子
  // 会分别乘以子元素的宽、高，最终的结果就是 Align 组件的宽高
  this.widthFactor,
  this.heightFactor,
  Widget child,
})

   return Align(
      heightFactor: 1.6,   // 定位   （微调）
      widthFactor: 1.2,
      // alignment: Alignment.topLeft,
      child: card(),
    );
```

- FractionalOffset

``` 
    return Align(
      alignment: FractionalOffset(0,0.02), // 指示标 为 左上角
      child: card(),
    );
```