<?php
namespace app\home\model;
use think\Model;
use app\home\model\TutorModel;

class TutorClassifyModel extends Model
{
	protected $table = 'siging_tutor_classify';

	public function getTutor(){
		return $this->hasMany('TutorModel','classify_id','classify_id');
		// return $this->hasMany('ApplyLearningKnowModel','learning_know_type_id','know_type_id');
	}

    
}