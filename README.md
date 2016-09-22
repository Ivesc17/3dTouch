# 3dTouch

/*
    设置静态ShortCut
        1、info.plist 添加相应属性
            *必须设置的项
                UIApplicationShortcutItemType 标识
                UIApplicationShortcutItemTitle 标题
            选填项
                UIApplicationShortcutItemSubtitle 副标题
                UIApplicationShortcutItemIconType Icon类型
                UIApplicationShortcutItemIconFile Icon文件名
        2、在appdelegate中实现代理方法，接收点击事件
            - (void)application:(UIApplication *)application performActionForShortcutItem:(nonnull UIApplicationShortcutItem *)shortcutItem completionHandler:(nonnull void (^)(BOOL))completionHandler
*/

/*
    设置动态ShortCut
    注意： 如果静态标签达到了4个，则设置的动态标签无效（标签上限就是4个）
    
    设置方法详见代码  ICDynamicShortCutViewController
*/
