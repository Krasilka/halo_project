
After do |scenario|

   begin
     APIMethods.delete_module(@module_id, @access_token)
   rescue
     puts "Module is already removed!"
   end

end