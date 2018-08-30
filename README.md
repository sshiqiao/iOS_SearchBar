# iOS_SearchBar
A custom searchBar that runs on iOS

Android版本请点击[这里](https://github.com/sshiqiao/Android_SearchBar)。

<pre>
//初始化SearchBar 位置大小、searchBarStretchWidth展开宽度
SearchBar *searchBar = [[SearchBar alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-100, 50, 50, 50) searchBarStretchWidth:330];
searchBar.placeholder = @"default searchBar";
</pre>

<pre>
//初始化SearchBar 位置大小、searchBarEdgeColor边框颜色
SearchBar *searchBar = [[SearchBar alloc]initWithFrame:CGRectMake(40, 150, 30, 30) searchBarEdgeColor:GrayColor];
//设置展开方向
[searchBar setSearchBarStretchDirection:1];
</pre>

![image](https://github.com/sshiqiao/iOS_SearchBar/blob/master/SearchBar/demo1.gif)
