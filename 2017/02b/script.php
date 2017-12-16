<?php

define('DEBUG', false) ;

$tests = array(
  '0' => array('file' => '0.txt', 'output' => 9),
  '1' => array('file' => '0.txt', 'output' => 9)
) ;

$z = new Worker() ;

foreach ($tests as $num => $test) {
  $z->openFile($test['file']) ;
  if ($z->getChecksum() != $test['output']) echo "Test $num failed.\n" ;
}

$z->openFile('input.txt') ;
echo "Answer is: ", $z->getChecksum() , "\n" ;

class Worker {

  private $sheet = array() ;
  private $handle ;
  private $quotients = array() ;
  private $checksum = 0 ;
  
  public function __construct() {}
  
  public function openFile($filename) {
    
    $this->handle = fopen($filename, "r") ;
    
  }
  
  public function getChecksum() {
    
    $this->sheet = array() ;
    $this->quotients = array() ;
    $this->readFileToArray() ;
    $this->makeRowChecksum() ;
    $this->makeSheetChecksum() ;
    return ($this->checksum) ;
  
  }
  
  private function readFileToArray() {
  
    if ($this->handle !== FALSE) {
    
      while (($data = fgetcsv($this->handle, 0, "\t")) !== FALSE) {
      
        if (DEBUG) var_dump($data) ;
        $this->sheet[] = $data ;
      
      }
    
    if (DEBUG) var_dump($this->sheet) ;
    
    }
  
  }
  
  private function makeRowChecksum() {
  
    foreach ($this->sheet as $row) {
    
      rsort($row) ;      
      if (DEBUG) var_dump($row) ;
      
      foreach ($row as $col1 => $cell) {
      
        foreach (array_keys($row) as $col2) {
        
          if ($col1 !== $col2) {
          
            $quotient = $cell / $row[$col2] ;
            if (is_integer($quotient)) $this->quotients[] = $quotient ;
          
          }
        }
      }
    }
  
  if (DEBUG) var_dump($this->quotients) ;
  
  }
  
  private function makeSheetChecksum() {
  
    $this->checksum = array_sum($this->quotients) ;
  
  }

}


