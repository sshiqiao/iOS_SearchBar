# iOS_SearchBar
A custom searchBar that runs on iOS

1. iOS_SearchBar(https://github.com/sshiqiao/iOS_SearchBar)

2. Android_SearchBar(https://github.com/sshiqiao/Android_SearchBar)

//初始化SearchBar 位置大小、searchBarStretchWidth展开宽度
SearchBar *searchBar = [[SearchBar alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-100, 50, 50, 50) searchBarStretchWidth:330];
searchBar.placeholder = @"default searchBar";


//初始化SearchBar 位置大小、searchBarEdgeColor边框颜色
SearchBar *searchBar = [[SearchBar alloc]initWithFrame:CGRectMake(40, 150, 30, 30) searchBarEdgeColor:GrayColor];
//设置展开方向
[searchBar setSearchBarStretchDirection:1];

![image](https://github.com/sshiqiao/iOS_SearchBar/blob/master/SearchBar/demo1.gif)
