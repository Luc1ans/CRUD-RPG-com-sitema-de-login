//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CRUDGame
{
    using System;
    using System.Collections.Generic;
    
    public partial class Personagem_Habilidade
    {
        public int IdPersonHab { get; set; }
        public int Habilidades_IdHabilidade { get; set; }
        public int Personagens_IdPersonagem { get; set; }
    
        public virtual Habilidade Habilidade { get; set; }
        public virtual Personagen Personagen { get; set; }
    }
}
