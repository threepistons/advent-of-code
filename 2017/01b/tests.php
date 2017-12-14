<?php

require_once('worker.php') ;

$tests = array(
  array(
    'input' => '1212',
    'output' => 6,
  ),
  array(
    'input' => '1221',
    'output' => 0,
  ),
  array(
    'input' => '123425',
    'output' => 4,
  ),
  array(
    'input' => '123123',
    'output' => 12,
  ),
  array(
    'input' => '12131415',
    'output' => 4,
  )
) ;

define('DEBUG', false) ;

$moo = new AdventOneA() ;

foreach ($tests as $test) {
  $moo->getInput($test['input']) ;
  if ($test['output'] != $moo->getOutput()) echo $test['input'], ' failed.' ;
}
