﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Http;
using System.Threading.Tasks;

namespace Proyecto2.ClienteWeb
{
    public class HttpInstance
    {
        private static HttpClient httpClientInstance;
        private HttpInstance()
        {

        }
        public static HttpClient GetHttpClientInstance()
        {
            if (httpClientInstance == null)
            {
                httpClientInstance = new HttpClient();
                httpClientInstance.DefaultRequestHeaders.ConnectionClose = false;
            }
            return httpClientInstance;
        }
    }
}