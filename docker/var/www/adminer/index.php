<?php
/**
 * Override for permanent login
 */

 // This will cause Adminer to try the login
 $_GET['username'] = '';

 // The Adminer override
function adminer_object()
{
  
  class AdminerSoftware extends Adminer
  {
    
    public function name()
    {
        $names = [
            'Vladis',
            'Vladislav',
            'Vlado',
            'Vladominer'
        ];
        
        return $names[mt_rand(0, count($names)-1)];
    }

    public function credentials()
    {
      // server, username and password for connecting to database
      return ['mysql', 'root', 'root'];
    }
    
  }
  
  return new AdminerSoftware();
}

# Downloaded during image build
require_once('./adminer.php');