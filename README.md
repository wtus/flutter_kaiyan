
# 使用 Flutter 仿开眼视频App

![](https://tvax3.sinaimg.cn/crop.113.119.796.796.180/0065kqVkly8fkjuxfjwshj30sg0sgtao.jpg)

## 简介

[Eyepetizer](https://link.jianshu.com/?t=http://www.kaiyanapp.com/) 一直是我个人比较喜欢的app，之前有用原生模仿过开眼的一些效果，文章在[这里](https://wuht.coding.me/2017/09/19/2017-09-19-%E4%BB%BF%E5%BC%80%E7%9C%BC%E8%A7%86%E9%A2%91%E7%9A%84%E4%B8%80%E4%BA%9B%E6%95%88%E6%9E%9C/)，本次实践使用跨平台框架 Flutter 开发，对开眼 v4.2.2进行模仿。

## 用到的开源库

- dio: ^0.0.10  --网络请求 [地址](https://github.com/flutterchina/dio)
- scoped_model: "^0.2.0"  --状态管理 [地址](https://github.com/brianegan/scoped_model)

## Apk下载

[百度云下载地址](https://pan.baidu.com/s/1RtzKLrGYEJCdfRqO9Jamtw)

**github**:

![github](http://ww1.sinaimg.cn/large/006rV8gJgy1fu7w52npk1j3064064jr9.jpg)

## 预览图片

|                             首页                             |                             关注                             |
| :----------------------------------------------------------: | :----------------------------------------------------------: |
| ![](http://ww1.sinaimg.cn/mw690/006rV8gJgy1fte1x0lkkhj30k00zktn5.jpg) | ![](http://ww1.sinaimg.cn/mw690/006rV8gJgy1fte1xplt80j30k00zkduv.jpg) |
|                          **详情页**                          |                           **通知**                           |
| ![](http://ww1.sinaimg.cn/mw690/006rV8gJgy1fte21n5zxsg30ag0ione8.gif) | ![](http://ww1.sinaimg.cn/mw690/006rV8gJgy1fte22005qsj30k00zkwh5.jpg) |
|                           **我的**                           |                           **搜索**                           |
| ![](http://ww1.sinaimg.cn/mw690/006rV8gJgy1fte22ajbgsj30k00zkt9n.jpg) | ![](http://ww1.sinaimg.cn/mw690/006rV8gJgy1fte255v5hag30ag0ion3v.gif) |
|                       **上拉加载更多**                       |                        **Tabbar处理**                        |
| ![](http://ww1.sinaimg.cn/mw690/006rV8gJgy1fte2m3u8zpg30ag0ioty8.gif) | ![](http://ww1.sinaimg.cn/mw690/006rV8gJgy1fte2o236ocg30ag0iohdu.gif) |
|                       **关注吸顶效果**                       |                           **最后**                           |
| ![](http://ww1.sinaimg.cn/mw690/006rV8gJgy1fte2pvyksgg30ag0io7wh.gif) | ![](http://ww1.sinaimg.cn/mw690/006rV8gJgy1fte2tpuxp0g30ag0iok3v.gif) |

## 项目的地址

[项目地址](https://github.com/wtus/flutter_kaiyan)：https://github.com/wtus/flutter_kaiyan

## 心得体会

- 嵌套太深了，前期一定要注意组织整理一下，其实本Demo做的也不太好，但有点懒的改了，下一个Demo 好好控制一下吧[笑哭]。
- Hot Reload 可以很大程度上提高开发效率，但有时会失效。

- 性能没有刻意的和原生对比过，但是 release 之后运行速度的确是飞起。

- 我用过 Weex ，做过H5混合开发，了解过RN，我觉得 Flutter 是十分优秀的。
- 项目中早期有部分命名不规范的问题，危险动作，请勿学习。

## 一些说明

- 视频播放功能没有做，试了几个方案效果都是不是很理想，之后再说
- api 来自网络 ，【开眼】是一款每日精选视频应用的app，非官方版本，仅作学习交流之用，数据来源于开眼视频视频，数据接口均属于非正常渠道获取，请勿用于商业用途，原作公司拥有所有权利。

## 后语

之后会有一些教程讲解，欢迎关注。

## 关于我

- **Email**: hi54wht@163.com
- **博客**: https://wuht.coding.me/
- **掘金**: https://juejin.im/user/5a3127da5188251c11409f0a
- **简书**: https://www.jianshu.com/u/762002465748

