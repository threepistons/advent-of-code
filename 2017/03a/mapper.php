<?php

class Mapper {

  private $int = 1 ;
  private $result = 0 ;
  private $map = array() ;

  public function __construct() {}
  
  public function getInput($int) {
  
    if (is_integer($int)) {
  
      $this->int = $int ;
    
    } else throw new Exception ('Input must be an integer.') ;
  
  }
  
  public function getOutput() {
  
    return($this->result) ;
  
  }
  
  private function drawMap() {
   
    $this->map = array() ;
    // The access port
    $this->map[1] = array ('x' => 0, 'y' => 0) ;
    
    for ($i=1; $i<=$this->int; $i++) {
      // (the previous square is to my west AND the square to my north is clear) OR (the previous square is to my south AND the square to my west is occupied)
      if () {
        // place the next square to my north
        $this->map[$i+1]['x'] = $this->map[$i]['x'] ;
        $this->map[$i+1]['y'] = $this->map[$i]['y']+1 ;
      // (the previous square is to my south AND the square to my west is clear) OR (the previous square is to my east AND the square to my south is occupied)
      } else if () {
        // place the next square to my west
        $this->map[$i+1]['x'] = $this->map[$i]['x']-1 ;
        $this->map[$i+1]['y'] = $this->map[$i]['y'] ;
      // (the previous square is to my east AND the square to my south is clear) OR (the previous square is to my north AND the square to my east is occupied)
      } else if () {
        // place the next square to my south
        $this->map[$i+1]['x'] = $this->map[$i]['x'] ;
        $this->map[$i+1]['y'] = $this->map[$i]['y']-1 ;
      } else {
        // place the next square to my east
        $this->map[$i+1]['x'] = $this->map[$i]['x']+1 ;
        $this->map[$i+1]['y'] = $this->map[$i]['y'] ;
      }
    }
    
    if (DEBUG) var_dump($map) ;
    
  }
  
  

}
