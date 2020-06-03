<?php
namespace app\home\controller;
use think\facade\Request;
use think\Controller;
use app\home\model\ProductsModel;
use app\home\model\ProductMatch;

// 解决问题（产品）
class Products extends Common{
	
   // 1，彬跃计划，2.彬享计划，3.彬学计划',
    public static $productType = [
                            1=>'彬跃计划',
                            2=>'彬享计划',
                            3=>'彬学计划'
                        ];
// 1.GPA , 2.托福/雅思'', 3.GRE/GMAT, 4.背景提升活动
   public static $matchType = [
                1 => "GPA ",
                2 => "托福/雅思",
                3 => "GRE/GMAT",
                4 => "背景提升活动",
   ];

   public static $match =[
        1=>[
          'id'=>1,
          'name'=>'GPA',
          'data'=>[],
        ],
        2=> [
          'id'=>2,
          'name'=>'托福/雅思',
          'data'=>[],
        ],
        3=> [
          'id'=>3,
          'name'=>'GRE/GMAT',
          'data'=>[],
        ],
         4=>[
          'id'=>4,
          'name'=>'背景提升活动',
          'data'=>[],
        ],

  ];


    public function initialize()
    {
        parent::initialize();
      
    }



    /**
     * 产品筛选
     * @Author    XZJ
     * @DateTime  2020-04-23
     * @param     [param]
     * @return    [type]      [description]
     */
    public function selectType(){
         $productsMatch =  ProductMatch::where('status',1)->field('id,mark,type')->select()->toArray();
         $data = self::$match;
         $type1 = [];
         $type2 = [];
         $type3 = [];
         $type4 = [];
         foreach ($productsMatch as $key => $value) {
              if($value['type'] == 1){
                $type1[] = $value;
              }
              if($value['type'] == 2){
                $type2[] = $value;

              }
              if($value['type'] == 3){
                $type3[] = $value;

              }
              if($value['type'] == 4){
                $type4[] = $value;
              }
         }
         $data[1]['data'] = $type1;
         $data[2]['data'] = $type2;
         $data[3]['data'] = $type3;
         $data[4]['data'] = $type4;
         return self::returnJson(2,'success',$data);

    }


 
    /**
     * 解决问题列表
     * @Author    XZJ
     * @DateTime  2020-04-13
     * @param     [page]
     * @param     [limit]
     * @return    [type]      [description]
     */
    public function list(){
            $page = input('page') ? input('page') : 1;
            $degree = input('degree') ? input('degree') : 1;
            $pageSize = input('limit') ? input('limit') : config('pageSize');
            $products = ProductsModel::join(config('database.prefix').'siging_product_match m','m.id = siging_product.product_title','left')
                              ->where(['siging_product.status'=>1,'degree'=>$degree])
                              ->field('siging_product.id,product_type,product_describe,class_composition,product_pic,prodct_details_pic,application_result,cross_guarantee,header_describe,product_price,m.type')
                              ->paginate(array('list_rows' => $pageSize, 'page' => $page))->toArray();

             foreach ($products['data'] as $key => &$value) {

                $value['header_describe'] = explode(',', $value['header_describe']);
                if($value['product_type'] == 3){
                    $value['type_title'] = self::$matchType[$value['type']];
                }else{
                   $value['type_title'] = self::$productType[$value['product_type']];
                }
             }
             return self::returnJson(2,'success',$products);
      
    }

   
  
    /**
     * 产品详情
     * @Author    XZJ
     * @DateTime  2020-04-13
     * @copyright [copyright]
     * @version   [version]
     * @param     [param]
     * @return    [type]      [description]
     */
    public function detail(){
      $request = input("param.");
      if(empty($request['id'])){
         return  self::returnJson(-1,'必要参数为空！');
      }
         $productsDetail =  ProductsModel::find($request['id'])->toArray();
         if(!empty($productsDetail['header_describe'])){
              $productsDetail['header_describe'] =  trim($productsDetail['header_describe'],',');
              $productsDetail['header_describe'] =explode(',',$productsDetail['header_describe']);
         }
         return self::returnJson(2,'success',$productsDetail);
    }


    public function matching(){
        $request = input("param.");
        $degree = input('degree') ? input('degree') : '';
        $gpa = input('gpa') ? input('gpa') : '';
        $tfys = input('tfys') ? input('tfys') : '';
        $gg = input('gg') ? input('gg') : '';
        $bjts = input('bjts') ? input('bjts') : '';
        // $gpa  = '3.5+';
        // $tfys = '90/6.5';
        // $gg = '310/680'; //310/680
        // $bjts = '2';
         if(empty($degree)){
           return  self::returnJson(-1,'必要参数为空！');
        }

        $helpWhere[]  = ['siging_product.status','=',1];
        $helpWhere[]  = ['siging_product.degree','=',$degree];
        $helpWhere[]  = ['siging_product.product_type','=',3];
        $whereIn = [];
        // 1.GPA , 2.托福/雅思'', 3.GRE/GMAT, 4.背景提升活动
        $where = [];
       if(!empty($gpa)){
          array_push($whereIn, 1);
          array_push($where, $gpa);
       }
       if(!empty($tfys)){
           array_push($whereIn, 2);
           array_push($where, $tfys);
        }
        if(!empty($gg)){
            array_push($whereIn, 3);
           array_push($where, $gg);
       }
        if(!empty($bjts)){
            array_push($whereIn, 4);
           array_push($where, $bjts);
       }
       if(!empty($whereIn)){
          $helpWhere[]  = ['m.type','in',$whereIn];
       }
       if(!empty($where)){
          $helpWhere[]  = ['m.mark','in',$where];
       }
       // 主产品
        $mainProducts =  ProductsModel::join(config('database.prefix').'siging_product_match m','m.id = siging_product.product_title','left')
                              ->where(['siging_product.status'=>1,'degree'=>$degree])
                              ->where("product_type",'in',[1,2])
                              ->order('siging_product.sort')
                              ->field("siging_product.id,product_pic,product_type")
                              ->limit(2)->select()->toArray();
        // 辅助产品
        $helpProducts = ProductsModel::join(config('database.prefix').'siging_product_match m','m.id = siging_product.product_title','left')
                              ->where($helpWhere)
                              ->field("siging_product.id,product_name,product_pic,product_type,m.type,m.describe,m.keshi")
                              ->order('siging_product.sort')
                              ->select()->toArray();
         foreach ($helpProducts as $key => &$value) {
              $value['product_title'] =  self::$productType[$value['product_type']];
              $value['type_title'] =  self::$matchType[$value['type']];
        }

        $data['main'] = $mainProducts;
        $data['help'] = $helpProducts;
        return self::returnJson(2,'success',$data);
    }

  

}