#**Branch "ubuntu_image"**
   - Use image "roskamach/ubuntu_thunder" (Ubuntu+Nhinx+PHPFPM+Composer+Thunder)
   - Use image "mysql:5.7.22"
   - Use image "phpmyadmin"
   
#**Branch "ubuntu_build" -**
   - Use image "roskamach/ubuntu_baseimage" (Ubuntu+Nhinx+PHPFPM)
   - Build image based on "roskamach/ubuntu_baseimage" installed Composer&Thunder 
   - Use image "mysql:5.7.22"
   - Use image "phpmyadmin"
   

![alt text](https://www.drupal.org/files/Thunder_WBM_20160126.png)
