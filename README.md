# iOS_SearchBar
A custom searchBar that runs on iOS.
Click [here](https://github.com/sshiqiao/Android_SearchBar) for Android version.


<pre>
SearchBar *searchBar = [[SearchBar alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-100, 50, 50, 50) searchBarStretchWidth:330];
searchBar.placeholder = @"default searchBar";
</pre>

<pre>
SearchBar *searchBar = [[SearchBar alloc]initWithFrame:CGRectMake(40, 150, 30, 30) searchBarEdgeColor:GrayColor];
[searchBar setSearchBarStretchDirection:1];
</pre>

![image](https://github.com/sshiqiao/iOS_SearchBar/blob/master/SearchBar/demo1.gif)
