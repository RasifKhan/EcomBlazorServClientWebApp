using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ecommerce_Model
{
    public class SignUpResponseDTO
    {
        public bool IsRegistrationSuccessful { get; set; }

        public IEnumerable<String> Errors { get; set; }
    }
}
