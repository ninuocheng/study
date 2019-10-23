#!/bin/bash
if   ! grep -q '^#!'  $1;then
sed  '1i #!/bin/bash'  $1
sed  '2i #Description: '
fi
vim +2 $1
