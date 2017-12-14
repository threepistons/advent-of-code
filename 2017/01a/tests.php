<?php

require_once('worker.php') ;

$tests = array(
  array(
    'input' => '1122',
    'output' => 3,
  ),
  array(
    'input' => '1111',
    'output' => 4,
  ),
  array(
    'input' => '1234',
    'output' => 0,
  ),
  array(
    'input' => '91212129',
    'output' => 9,
  )
) ;

define('DEBUG', false) ;

$moo = new AdventOneA() ;

foreach ($tests as $test) {
  $moo->getInput($test['input']) ;
  if ($test['output'] != $moo->getOutput()) echo $test['input'], ' failed.' ;
}
