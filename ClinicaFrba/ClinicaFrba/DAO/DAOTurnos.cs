﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClinicaFrba.DAO
{
    class DAOTurnos
    {


        public static int bonosDisponibles(String numeroAfiliado)
        {

            SQLHelper.ConnectionValue = Properties.Settings.Default.conector;
            SQLHelper.CreateObjects(true);
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Clear();
            SqlParameter parameter;

            try
            {


                parameter = new SqlParameter("@numeroAfiliado", SqlDbType.BigInt);
                parameter.Value = numeroAfiliado;
                parameters.Add(parameter);

           

                return int.Parse(SQLHelper.SQLHelper_ExecuteScalar("JOINEANDO_ANDO.bonos_disponibles", parameters).ToString());


            }
            catch (Exception ex)
            {
                SQLHelper.RollBackTransction();
                throw ex;
            }
            finally
            {
                SQLHelper.CommitTransction();
                SQLHelper.ClearObjects();
            }

        }




        //PONER LOS FILTROS BIEN
             public static DataTable filtroAfiliados(string nombre = "", string apellido = "", string tipo = "", string numeroDocumento = "")
        {
            DataTable data = new DataTable();
            SQLHelper.ConnectionValue = Properties.Settings.Default.conector;
            SQLHelper.CreateObjects(true);
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Clear();
            SqlParameter parameter;

            try
            {

                if (nombre != "") {
                    parameter = new SqlParameter("@nombre", SqlDbType.NVarChar,255);
                    parameter.Value = nombre;
                    parameters.Add(parameter); 
                }
                if (apellido != "")
                {
                    parameter = new SqlParameter("@apellido", SqlDbType.NVarChar, 255);
                    parameter.Value = apellido;
                    parameters.Add(parameter);
                }
                if (tipo != "")
                {
                    parameter = new SqlParameter("@tipo", SqlDbType.NVarChar, 255);
                    parameter.Value = tipo;
                    parameters.Add(parameter);
                }

                if (numeroDocumento != "")
                {
                    parameter = new SqlParameter("@numerodocumento", SqlDbType.NVarChar, 255);
                    parameter.Value = numeroDocumento;
                    parameters.Add(parameter);
                }


                data = SQLHelper.SQLHelper_ExecuteReader("JOINEANDO_ANDO.listado_registro_atencion", parameters);
                return data;
            }
            catch (Exception ex)
            {
                SQLHelper.RollBackTransction();
                throw ex;
            }
            finally
            {
                SQLHelper.ClearObjects();
            }
        }

    }
}