<?php

    define('DEBUG', false) ;

    require_once('fastermapper.php') ;

    try {
        
        $z = new Mapper() ;

            $z->getInput(325489) ;
            echo $z->getOutput(), "\n" ;
        
    
    } catch (Exception $e) {
        echo 'Caught exception: ',  $e->getMessage(), "\n";
    }
