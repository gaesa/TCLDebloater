# TCLDebloater
Script to remove TCL TV bloatware using adb for mainland China users

## List of packages to consider uninstalling or disabling
com.tcl.bi  
com.snm.upgrade 软件升级  
com.tcl.versionUpdateApp 系统版本更新  
com.tcl.update 应用自动更新  
com.tcl.bootadservice 开机广告  
com.tcl.tshop T惠购 T商店  
com.tcl.tvsmartalbum 智能相册  
com.iflytek.xiri 讯飞语音  
com.iflytek.xiri.translate  
com.iflytek.xiri.recorder.svc 讯飞语音  
com.iflytek.xiri2.hal 讯飞语音  
com.iflytek.mictest  
com.xiaodianshi.tv.yst  
com.tcl.wholenetsearch 搜索  
com.sohu.inputmethod.sogou.tv 搜狗输入法  
com.tcl.common.weather 天气预报 没找到替代品就别卸载  
com.android.providers.contacts 联系人  
com.cibn.tv CIBN酷喵  
com.hunantv.market 芒果TV  
com.tcl.videocall 视频通话  
com.tcl.qiyiguo  
com.iqiyi.i18n.tv.tcl  
com.tcl.usercenter 用户中心（实际上就是在线帐号）  
com.tcl.weixin 微信互联  
com.tcl.appmarket2  
com.tcl.tliveplay 轮播频道 王牌频道  
com.golive.cinema 同步院线  
com.tcl.vod 企鹅影视  
com.tcl.selfbuy  
com.huan.edu.lexue.frontend 乐学教育 啥教育  
com.android.tcl.messagebox 消息盒子  
com.tcl.c2dm.client 消息盒子  
com.tcl.cyberui 桌面 可以安装第三方桌面就可以禁用或卸载  
com.tcl.ffkaraoke 全民K歌  
com.audiocn.kalaok.tv 天籁K歌  
com.tcl.tv.jtq 家庭圈  
com.tcl.gamecenter 游戏中心 T2娱乐健身中心  
com.tcl.playskill 玩机技巧  
com.tencent.qqmusictv  
com.tcl.ffeducation 雷鸟教育  
com.kookong.tvplus 遥控专家酷控 机顶盒设置  
com.tcl.SmartTVHelp 使用说明  
com.tcl.MultiScreenInteraction_TV 多屏互动  
com.TCL.MultiScreenInteraction_TV 多屏互动  
com.tcl.appreciate.art 艺生活  
com.kwai.tv.yst 快手TV  
com.ktcp.csvideo 云视听极光（腾讯TV）  
com.tcl.convergehome 智慧家居  
com.android.bluetooth 蓝牙  
com.tcl.morningmode 清晨时刻  
com.tcl.ui_mediaCenter 媒体中心 卸载会造成本地文件无法访问  
com.tcl.tvweishi  电视卫士 没找到替代品就别卸载  
com.tcl.browser 全景浏览器  

## Usage

### Unrestrict adb/pm install
```shell
adb shell setprop persist.tcl.installapk.enable 1
adb shell setprop persist.tcl.debug.installapk 1
```

### List, remove, disable bloatware
Usage:  
  **tcl** *command*  
  
|Available Commands| Description |
| --- | --- |
  |help      |Show help about this program|
  |list      |List all installed user packages|
  |clean     |Uninstall some useless user packages|
  |disable   |Disable uncontrollable updates of system and software|

## See also
[TCL电视免root 卸载预装应用，解锁安装权限](https://www.jianshu.com/p/7a1a9fba687d)  
[雷鸟电视卸载自带app 2022雷鸟电视卸载预装软件](https://www.znds.com/tv-1220172-1-1.html)  
[TCL/雷鸟电视删除系统内置广告及应用方法，无需root](https://zhuanlan.zhihu.com/p/535301521)  
[揭秘“太差了”智障电视](https://rocka.me/article/cursed-tcl-android-tv)
