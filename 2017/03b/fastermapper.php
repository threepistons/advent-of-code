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
    
    do {
    
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
    
      $this->populateSquare() ;
    
      if (DEBUG) var_dump($this->map) ;
    
    } while ($this->map[$this->currentx][$this->currenty] <= $this->int) ;
  
  }
  
  private function populateSquare() {
  
    $this->result = 0 ;
    // I want all the "minesweeper neighhours" of the current square
    if ($this->currentx === 0 and $this->currenty === 0 ) {
      // don't even think about doing anything
    } else {
        for ($x = $this->currentx-1; $x <= $this->currentx+1; $x++) {
        if (DEBUG) echo "entered outer for loop\n" ;
        if (array_key_exists($x, $this->map)) {
        
            for ($y = $this->currenty-1; $y <= $this->currenty+1; $y++) {
            if (DEBUG) echo "entered inner for loop\n" ;
            if (array_key_exists($y, $this->map[$x])) {
                
                $this->result += $this->map[$x][$y] ;
                if (DEBUG) echo $this->result, "\n" ;
            }
            
            }
            
        }
        
        }
            
        $this->map[$this->currentx][$this->currenty] = $this->result ;
        if (DEBUG) echo $this->result, "\n" ;
    
    }
  
  }
  
  

}
