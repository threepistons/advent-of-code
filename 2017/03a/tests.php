<?php

    define('DEBUG', true) ;

    require_once('mapper.php') ;

    $tests = array (
        array ('input' => 1, 'output' => 0),
        array ('input' => 12, 'output' => 3),
        array ('input' => 23, 'output' => 2),
        array ('input' => 1024, 'output' => 31)
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
