<?php

  require_once('validator.php') ;
  define('DEBUG', false) ;

  $a = new Validator() ;
  
  $a->getInput('input.txt') ;
  echo $a->getOutput() , "\n" ;
