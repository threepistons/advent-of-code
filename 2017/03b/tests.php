<?php

    define('DEBUG', false) ;

    require_once('fastermapper.php') ;

    $tests = array (
        array ('input' => 1, 'output' => 2),
        array ('input' => 2, 'output' => 4),
        array ('input' => 4, 'output' => 5),
    ) ;
    
    try {
        
        $z = new Mapper() ;

        foreach ($tests as $test) {
            $z->getInput($test['input']) ;
            if ($z->getOutput() != $test['output']) echo "Test ", $test['input'], " failed\n" ;
        }
    
    } catch (Exception $e) {
        echo 'Caught exception: ',  $e->getMessage(), "\n";
    }
