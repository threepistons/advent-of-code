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
  
    $this->drawMap() ;
    $this->result = abs($this->map[$this->int]['x']) + abs ($this->map[$this->int]['y']) ;
    if (DEBUG) echo "x=", abs($this->map[$this->int]['x']), "  y=", abs($this->map[$this->int]['y']), "\n" ;
    return($this->result) ;
  
  }
  
  private function drawMap() {
   
    $this->map = array() ;
    // The access port
    $this->map[1] = array ('x' => 0, 'y' => 0) ;
    
    // if (There is something to my south and nothing to my west) go west.
    // else if (There is something to my east and nothing to my south) go south.
    // else if (There is something to my west and nothing to my north) go north.
    // else go east.
    
    for ($i=1; $i<=$this->int; $i++) {
      // There is something to my west and nothing to my north
      if (!(in_array(array('x' => $this->map[$i]['x'],'y' => $this->map[$i]['y']+1), $this->map)) AND in_array(array('x' => $this->map[$i]['x']-1,'y' => $this->map[$i]['y']),$this->map)) {
        // place the next square to my north
        $this->map[$i+1]['x'] = $this->map[$i]['x'] ;
        $this->map[$i+1]['y'] = $this->map[$i]['y']+1 ;
      // There is something to my south and nothing to my west
      } else if (!(in_array(array('x' => $this->map[$i]['x']-1,'y' => $this->map[$i]['y']), $this->map)) AND in_array(array('x' => $this->map[$i]['x'],'y' => $this->map[$i]['y']-1),$this->map)) {
        // place the next square to my west
        $this->map[$i+1]['x'] = $this->map[$i]['x']-1 ;
        $this->map[$i+1]['y'] = $this->map[$i]['y'] ;
      // There is something to my east and nothing to my south
      } else if (!(in_array(array('x' => $this->map[$i]['x'],'y' => $this->map[$i]['y']-1), $this->map)) AND in_array(array('x' => $this->map[$i]['x']+1,'y' => $this->map[$i]['y']),$this->map)) {
        // place the next square to my south
        $this->map[$i+1]['x'] = $this->map[$i]['x'] ;
        $this->map[$i+1]['y'] = $this->map[$i]['y']-1 ;
      } else {
        // place the next square to my east
        $this->map[$i+1]['x'] = $this->map[$i]['x']+1 ;
        $this->map[$i+1]['y'] = $this->map[$i]['y'] ;
      }
      if ($i % 1000 === 0) echo "At $i\n" ;
    }
    
    if (DEBUG) var_dump($this->map) ;
    
  }
  
  

}
