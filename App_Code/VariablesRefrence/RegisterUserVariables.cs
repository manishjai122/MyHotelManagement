using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace VariablesRefrence
{
    public class RegisterUserVariables
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Mobile_No { get; set; }
        public string Email_Id { get; set; }
        public string Address { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Document_Type { get; set; }
        public string Document_Number { get; set; }
        public string Document_Image { get; set; }

        
        public Boolean AdminRequest { get; set; }
        public int UserId { get; set; }
    }
}