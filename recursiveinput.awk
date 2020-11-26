#!/usr/bin/env gawk -f

BEGIN{
  FS="\\input{|}"
  AWK=ENVIRON["PHD_RECUSRIVE_INPUT_AWK"]
}{
  regex="(%*)(.*)\\input{(.*)}";
  if(match($0,regex,a)){
    file = a[3];
    if(a[1]==""){
      match(file,".tex",b);
      if(RLENGTH<0){
          system(AWK" "file".tex");
      }
      else{
          system(AWK" "file);
      }
    }
  }
  else{
    print $0
  }
}
