<?php

class AdventOneA {

  private $input = 0;
  
  public function __construct() {
  }
  
  public function getInput($newinput) {
  // normally I would PEAR::Validate this for numericness
    $this->input = $newinput ;
  }
  
  public function getOutput() {
    $a = str_split($this->input) ;
    $b = $a ;
    array_unshift($b,array_pop($b)) ;
    $c = array_intersect_assoc($a,$b) ;
    if (DEBUG) {
      var_dump($a) ;
      var_dump($b) ;
      var_dump($c) ;
    }
    return(array_sum($c)) ;
  }

}
