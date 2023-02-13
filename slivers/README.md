# [Slivers](https://www.bilibili.com/video/BV1RK4y1R74t/?spm_id_from=333.788&vd_source=83da98d8985f0fa951db1dc630364972) 滚动的一小块东西


### 对比
- ListView => SliverList
  - ListView.build => SliverChildBuilderDelegate
  - ListView() 普通 => SliverChildListDelegate
- PageView => SliverFillViewport    

#### 组件转换

普通组件转换为 Sliver

``` 
SliverToBoxAdapter(
    child: FlutterLogo(),
)
```

#### 一个下拉控制器中嵌入多个不同的 , 拼接

``` 
body: CustomScrollView(
    slivers: [   
      SliverToBoxAdapter(       // 拼接的东西
        child: Column(
          children: [
            FlutterLogo(
              size: 60,
            ),
            Text("Hello Sliver!")
          ],
        ),
      ),
      SliverList(                  // List
          delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            height: 200,
            color: Colors.primaries[index % Colors.primaries.length],
          );
        },
        childCount: 18,
      )),
    ],
),
```

##### SliverGrid

``` 
SliverGrid(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return Container(
                    height: 200,
                    color: Colors.primaries[index % Colors.primaries.length],
                  );
                },
                childCount: 180, 
              ),
              // 控制每行显示个数
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4
              ),
          ),
```

##### 固定特定的高度

``` 
SliverFixedExtentList(
    delegate: SliverChildListDelegate([
      FlutterLogo(
        size: 60,
      ),
      Text("Hello Sliver!"),
      FlutterLogo(
        size: 300, // 会被覆盖掉
      ),
      Text("Hello Sliver!")
    ]),
    itemExtent: 100),   // 固定100高度
```

##### 通过原型设置高度

子元素高宽 按照 prototypeItem 原型 设置

``` 
SliverPrototypeExtentList(
  delegate: SliverChildListDelegate([
    FlutterLogo(
      size: 60,
    ),
    Text("Hello Sliver!"),
    FlutterLogo(
      size: 300,
    ),
    Text("Hello Sliver!")
  ]),
  prototypeItem: FlutterLogo(size: 48,),
),
```


##### SliverFillViewport 

``` 
          SliverFillViewport(
            delegate: SliverChildListDelegate([
              FlutterLogo(
                size: 60,
              ),
              Text("Hello Sliver!"),
              FlutterLogo(
                size: 300,
              ),
              Text("Hello Sliver!")
            ]),
          ),
```


##### SliverAppBar   

``` 
SliverAppBar(
    // title: Text("Sliver App Bar"),

    // pinned: true, // 固定显示

    floating: true, // 稍微回滚 显示AppBar 默认为false需要滑动到最上面才显示
    snap: true, // 配合 floating

    // flexibleSpace 往下扩张 (美丽)
    expandedHeight: 300,
    stretch: true, // 拉伸
    flexibleSpace: FlexibleSpaceBar(
      background: FlutterLogo(),
      title: Text("Flexible Space Bar Title"),
      collapseMode: CollapseMode.parallax, // 上滑效果
      stretchModes: [ // 拉伸效果
        StretchMode.blurBackground, // 模糊背景
        StretchMode.zoomBackground, // 放大
        StretchMode.fadeTitle, // 消失title
      ],
    ),
  ),
```