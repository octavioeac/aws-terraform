variable "names"        { 
    type = list(string) 
    }
variable "keep_last"    { 
    type = number 
    default = 30 
    }
variable "scan_on_push" { 
    type = bool   
    default = true 
    }
variable "immutable"    { 
    type = bool
    default = true 
    }
variable "kms_key_arn"  { 
    type = string 
    default = ""
     } 
variable "tags"         { 
    type = map(string)
    default = {} 
    }
