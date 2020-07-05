<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

/*Route::get('CLTPHP', function () {
    return 'hello,CLTPHP!';
});*/
/*Route::POST('apply_<name>', '/home/ApplyApiController/apply_:name')
->pattern(['t' => '\w+', 'r' => '\w+', 's' => '\w+']);*/
return [
    '/index/[:userId]'=>'home/index/index', //首页
    '/activity/[:userId]'=>'home/index/activity', //活动
    '/share/[:userId]'=>'home/index/share', //分享
    '/collection/[:userId]'=>'home/index/collection', //收藏
    '/attention/[:userId]'=>'home/index/attention', //收藏
    '/join/[:userId]'=>'home/index/join', //想参加
    '/actdetail/[:userId]'=>'home/index/activity_detail', //活动详情
    '/login'=>'home/login/index', // 授权
    '/setinfo'=>'home/login/setUserInfo', // 设置用户信息
    '/search/[:userId]'=>'home/index/search_list', // 搜索列表
    '/test/[:userId]'=>'home/index/test', // 搜索列表
    '/majors/[:userId]'=>'home/majors/index',
    '/tutor/[:userId]'=>'home/tutor/list',
    '/tdetail/[:userId]/[:tutor_id]'=>'home/tutor/detail', //导师详情
    '/subject/[:userId]/[:subjectId]/[:majorId]'=>'home/subject/index', //专业美国
    '/uksubject/[:userId]/[:subjectId]/[:majorId]'=>'home/subject/index_uk', //专业英国
    '/pType/[:userId]'=>'home/products/selectType', //产品搜索类型
    '/products/[:userId]/[:page]/[:limit]'=>'home/products/list', //产品列表
    '/pdetail/[:userId]/[:id]'=>'home/products/detail', //产品详情
    '/pmatching/[:userId]/[:degree]/[:gpa]/[:tfys]/[:gg]/[:bjts]'=>'home/products/matching', //匹配
    '/bannerwall/[:userId]'=>'home/bannerwall/list', //产品详情
    '/help/[:userId]'=>'home/index/help',//客服
    '/organizeList/[:userId]'=>'home/index/organizeList',//主办方活动列表
    '/organizeInfo/[:userId]'=>'home/index/organizeInfo',//主办方信息
    '/info/[:userId]'=>'home/index/info',//个人信息
    '/getInfo/[:userId]'=>'home/index/getInfo',//获取个人信息
    //



    // 'about/:catId'=>'home/about/index',
    // 'download/:catId'=>'home/download/index',
    // 'services/:catId'=>'home/services/index',
    // 'servicesInfo/:catId/[:id]'=>'home/services/info',
    // 'system/:catId'=>'home/system/index',
    // 'news/:catId'=>'home/news/index',
    // 'info/:catId/[:id]'=>'home/news/info',
    // 'team/:catId'=>'home/team/index',
    // 'contact/:catId'=>'home/contact/index',
    // 'senmsg'=>'home/index/senmsg',
    // 'down/:id'=>'home/index/down',
    // 'tags/:keyword'=>'home/tags/index',

];

/*Route::group('apply', function(){
    Route::any(':num','demo2');
    Route::any(':str','demo3');
    Route::any(':bool','demo4' );
},
['method'=>'get|post','ext'=>'ps','prefix'=>'index/Index/'],
['num' => '\d{2,4}' , 'str' => '[a-zA-Z]' , 'bool' => '0|1' ]);*/
