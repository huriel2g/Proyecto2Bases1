﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto2.WebApi.Models
{
    public class Cuenta
    {
        public int cuenta { get; set; }
        public int NoFactura { get; set; }
        public DateTime FechaEmision { get; set; }
        public double TotalFactura { get; set; }
        public double SaldoFactura { get; set; }
        public int Cliente { get; set; }
        public int EstadoCuenta { get; set; }

        public Cuenta(int cuenta,int NoFactura,DateTime FechaEmision,double TotalFactura,double SaldoFactura,int Cliente,int EstadoCuenta)
        {
            this.cuenta = cuenta;
            this.NoFactura = NoFactura;
            this.FechaEmision = FechaEmision;
            this.TotalFactura = TotalFactura;
            this.SaldoFactura = SaldoFactura;
            this.Cliente = Cliente;
            this.EstadoCuenta = EstadoCuenta;
        }

    }
}