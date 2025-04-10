﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ecommerce_Model
{
    public class SignUpRequestDTO
    {
       [Required(ErrorMessage = "Name is required")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Email is required")]

        [RegularExpression("^[a-zA-Z0-9_.-]+@[a-zA-Z0-9-]+.[a-zA-Z0-9-.]+$", ErrorMessage = "Invalid email address")]
        public string Email { get; set; }
        public string PhoneNumber { get; set; }


        [Required(ErrorMessage = "Password is required")]
       [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required(ErrorMessage = "Confirmed password is required")]
        [DataType(DataType.Password)]
       [Compare("Password",ErrorMessage ="Password and Confirmed password is not matched")]
        public string ConfirmedPassword { get; set; }
    }
}
 