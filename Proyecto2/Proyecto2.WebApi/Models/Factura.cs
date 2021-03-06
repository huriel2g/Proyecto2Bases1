﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto2.WebApi.Models
{
    public class Factura
    {
        public int factura { get; set; }
        public DateTime FechaHora { get; set; }
        public int Cliente { get; set; }
        public int NIT { get; set; }
        public double Total { get; set; }
        public double IVA_Venta { get; set; }

        public Factura(int factura,DateTime FechaHora,int cliente,int nit,double total,double iva)
        {
            this.factura = factura;
            this.FechaHora = FechaHora;
            this.Cliente = cliente;
            this.NIT = nit;
            this.Total = total;
            this.IVA_Venta = iva;
        }
    }
}