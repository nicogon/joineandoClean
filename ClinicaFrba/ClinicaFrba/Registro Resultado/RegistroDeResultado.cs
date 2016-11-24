﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ClinicaFrba.Registro_Resultado
{
    public partial class RegistroDeResultado : Form
    {
        string paciente_id;
        string consulta_id;
        public RegistroDeResultado(String elnombre,String paciente,string laconsulta)
        {
            
            InitializeComponent();
            consulta_id = laconsulta;
            nnombre.Text = "Paciente: " + elnombre;
            paciente_id = paciente;


            
         
        }

        private void RegistroDeResultado_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            sintomas.Items.Add(sintoma.Text);
            sintoma.Text = "";

        }

        private void sintomas_SelectedIndexChanged(object sender, EventArgs e)
        {
            sintomas.Items.Remove(sintomas.SelectedItem);
        }

        private void button4_Click(object sender, EventArgs e)
        {
            if (sintomas.Items.Count == 0 || enfermedad.Text == "" || diagnostico.Text == "") {
                MessageBox.Show("Por favor complete todos los items de el registro de resultados", "Registro de resultados", MessageBoxButtons.OK, MessageBoxIcon.Error);
            } else {
                DAO.DAOResultados.guardarResultado(paciente_id, consulta_id, enfermedad.Text, diagnostico.Text, sintomas.Items.Cast<string>().ToList());
                MessageBox.Show("Diagnostico cargado con exito", "Registro de resultados", MessageBoxButtons.OK, MessageBoxIcon.Information);
           
            }
        }
    }
}
