# PMFlatProgressView

Animated flat progressview for iOS

![Screen1](https://github.com/peromasamune/PMFlatProgressView/blob/master/screens/screen1.png?raw=true)

## How to use

* Import header file

```objective-c
#import "PMFlatProgressView"
```

* Create object  

```objective-c
PMFlatProgressView * progress = [[PMFlatProgressView alloc] initWithFrame:CGRectMake(0, 0, 300, 120)];
progress.center = self.view.center;
[self.view addSubview:progress];
```

* Animate progress  

```objective-c
[progress setProgress:0.8 duration:3.0 block:^(BOOL completed) {
    NSLog(@"Animation Completed");
}];
```  

* Advanced settings

![Screen2](https://github.com/peromasamune/PMFlatProgressView/blob/master/screens/screen2.png?raw=true)

```objective-c
PMFlatProgressView * progress = [[PMFlatProgressView alloc] initWithFrame:CGRectMake(0, 0, 300, 120)];
progress.center = self.view.center;
progress.borderWidth = 0;
progress.cornerRadius = 20;
progress.colorArray = [NSArray arrayWithObjects:(id)[UIColor greenColor].CGColor, (id)[UIColor yellowColor].CGColor, nil];
progress.progressBackgroundColor = [UIColor colorWithWhite:0.000 alpha:0.5];
[self.view addSubview:progress];
```  

##License
Copyright &copy; 2013 Peromasamune  
Distributed under the [MIT License][mit].
[MIT]: http://www.opensource.org/licenses/mit-license.php 
