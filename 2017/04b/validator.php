<?php

class Validator {

  private $file ;

  public function __construct() {}
  
  public function getInput($filename) {
  
    $handle = fopen($filename, "r") ;
    if ($handle === FALSE) throw new Exception ('File not opened.') ;
    $this->file=fread($handle,filesize($filename));
    
  }
  
  public function getOutput() {
  
    $i = 0 ;
  
    $lines=explode(PHP_EOL,$this->file) ;
    
    foreach($lines as $line) {
      
      if ('' === trim($line)) {
      } else {
        $words = explode(' ', $line) ;
        
        foreach ($words as $key => $word) {
          $words[$key] = $this->sortString($word) ;
        }
        
        if (count($words) === count(array_unique($words))) $i++ ;
        if (DEBUG) var_dump($words) ;
        if (DEBUG) var_dump(array_unique($words)) ;
        
        }
        }
    
    return $i ;
    
  }
  
  private function sortString($word) {
  
    $letters = str_split($word,1) ;
    sort($letters) ;
    $word = implode($letters) ;
    return $word ;
  
  }

}
