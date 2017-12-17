<?php

class Mapper {

  private $int = 1 ;
  private $result = 0 ;
  private $map = array() ;
  private $currentx = 0 ;
  private $currenty = 0 ;

  public function __construct() {}
  
  public function getInput($int) {
  
    if (is_integer($int)) {
  
      $this->int = $int ;
    
    } else throw new Exception ('Input must be an integer.') ;
  
  }
  
  public function getOutput() {
  
    $this->drawMap() ;
    $this->result = abs($this->currentx) + abs($this->currenty) ;
    if (DEBUG) echo "x=", abs($this->currentx), "  y=", abs($this->currenty), "\n" ;
    return($this->result) ;
  
  }
  
  private function drawMap() {
   
    $this->map = array() ;
    // $this->map[$x][$y] for the value at x,y
    // The access port is 0,0.
    $this->map[0][0] = 1 ;
    
    $this->currentx = 0 ;
    $this->currenty = 0 ;
    
    // if (There is something to my south and nothing to my west) go west.
    // else if (There is something to my east and nothing to my south) go south.
    // else if (There is something to my west and nothing to my north) go north.
    // else go east.
    
    for ($i=2; $i<=$this->int; $i++) {
    
      // There is something to my west and nothing to my north
      if (array_key_exists($this->currentx-1,$this->map) AND array_key_exists($this->currenty,$this->map[$this->currentx-1]) AND !( array_key_exists($this->currentx,$this->map) AND array_key_exists($this->currenty+1, $this->map[$this->currentx]) )) {
        // place the next square to my north
        $this->currenty++ ;
      // There is something to my south and nothing to my west
      } else if (array_key_exists($this->currentx,$this->map) AND array_key_exists($this->currenty-1,$this->map[$this->currentx]) AND !( array_key_exists($this->currentx-1,$this->map) AND array_key_exists($this->currenty, $this->map[$this->currentx-1]) )) {
        // place the next square to my west
        $this->currentx-- ;
      // There is something to my east and nothing to my south
      } else if (array_key_exists($this->currentx+1,$this->map) AND array_key_exists($this->currenty,$this->map[$this->currentx+1]) AND !( array_key_exists($this->currentx,$this->map) AND array_key_exists($this->currenty-1, $this->map[$this->currentx]) )) {
        // place the next square to my south
        $this->currenty-- ;
      } else {
        // place the next square to my east
        $this->currentx++ ;
      }
      
      if (DEBUG) echo "X is ", $this->currentx, "   Y is ", $this->currenty, "    I is $i\n" ;
      $this->map[$this->currentx][$this->currenty] = $i ;
      if ($i % 1000 === 0) echo "At $i\n" ;
    }
    
    if (DEBUG) var_dump($this->map) ;
    
  }
  
  

}
