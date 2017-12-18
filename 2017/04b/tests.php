<?php

  require_once('validator.php') ;
  define('DEBUG', true) ;

  $tests = array('input' => 'tests.txt', 'output' => 3) ;

  $a = new Validator() ;
  
  $a->getInput($tests['input']) ;
  if ($a->getOutput() !== $tests['output']) echo "Test failed\n" ;
