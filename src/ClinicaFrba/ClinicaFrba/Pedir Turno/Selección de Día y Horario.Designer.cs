﻿namespace ClinicaFrba.Pedir_Turno
{
    partial class Selección_de_Día_y_Horario
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.TurnosDisponiblesGB = new System.Windows.Forms.GroupBox();
            this.VolverButton = new System.Windows.Forms.Button();
            this.ConfirmarTurnoButton = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.TurnosDisponiblesDGW = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.CalendarioTurnos = new System.Windows.Forms.MonthCalendar();
            this.TurnosDisponiblesGB.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.TurnosDisponiblesDGW)).BeginInit();
            this.SuspendLayout();
            // 
            // TurnosDisponiblesGB
            // 
            this.TurnosDisponiblesGB.Controls.Add(this.VolverButton);
            this.TurnosDisponiblesGB.Controls.Add(this.ConfirmarTurnoButton);
            this.TurnosDisponiblesGB.Controls.Add(this.label2);
            this.TurnosDisponiblesGB.Controls.Add(this.TurnosDisponiblesDGW);
            this.TurnosDisponiblesGB.Controls.Add(this.label1);
            this.TurnosDisponiblesGB.Controls.Add(this.CalendarioTurnos);
            this.TurnosDisponiblesGB.Font = new System.Drawing.Font("Microsoft Sans Serif", 10F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.TurnosDisponiblesGB.Location = new System.Drawing.Point(13, 13);
            this.TurnosDisponiblesGB.Name = "TurnosDisponiblesGB";
            this.TurnosDisponiblesGB.Size = new System.Drawing.Size(483, 311);
            this.TurnosDisponiblesGB.TabIndex = 0;
            this.TurnosDisponiblesGB.TabStop = false;
            this.TurnosDisponiblesGB.Text = "Turnos Disponibles:";
            // 
            // VolverButton
            // 
            this.VolverButton.BackColor = System.Drawing.Color.IndianRed;
            this.VolverButton.Location = new System.Drawing.Point(339, 269);
            this.VolverButton.Name = "VolverButton";
            this.VolverButton.Size = new System.Drawing.Size(127, 30);
            this.VolverButton.TabIndex = 7;
            this.VolverButton.Text = "Volver";
            this.VolverButton.UseVisualStyleBackColor = false;
            this.VolverButton.Click += new System.EventHandler(this.VolverButton_Click);
            // 
            // ConfirmarTurnoButton
            // 
            this.ConfirmarTurnoButton.Location = new System.Drawing.Point(197, 269);
            this.ConfirmarTurnoButton.Name = "ConfirmarTurnoButton";
            this.ConfirmarTurnoButton.Size = new System.Drawing.Size(127, 30);
            this.ConfirmarTurnoButton.TabIndex = 6;
            this.ConfirmarTurnoButton.Text = "Confirmar Turno";
            this.ConfirmarTurnoButton.UseVisualStyleBackColor = true;
            this.ConfirmarTurnoButton.Click += new System.EventHandler(this.ConfirmarTurnoButton_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(316, 41);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(135, 18);
            this.label2.TabIndex = 4;
            this.label2.Text = "Seleccione Horario";
            // 
            // TurnosDisponiblesDGW
            // 
            this.TurnosDisponiblesDGW.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.TurnosDisponiblesDGW.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.AllCells;
            this.TurnosDisponiblesDGW.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.TurnosDisponiblesDGW.Location = new System.Drawing.Point(319, 71);
            this.TurnosDisponiblesDGW.MultiSelect = false;
            this.TurnosDisponiblesDGW.Name = "TurnosDisponiblesDGW";
            this.TurnosDisponiblesDGW.ReadOnly = true;
            this.TurnosDisponiblesDGW.Size = new System.Drawing.Size(132, 162);
            this.TurnosDisponiblesDGW.TabIndex = 3;
            this.TurnosDisponiblesDGW.CellFormatting += new System.Windows.Forms.DataGridViewCellFormattingEventHandler(this.TurnosDisponiblesDGW_CellFormatting);
            this.TurnosDisponiblesDGW.DataBindingComplete += new System.Windows.Forms.DataGridViewBindingCompleteEventHandler(this.TurnosDisponiblesDGW_DataBindingComplete);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 11F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(79, 41);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(107, 18);
            this.label1.TabIndex = 1;
            this.label1.Text = "Seleccione Día";
            // 
            // CalendarioTurnos
            // 
            this.CalendarioTurnos.Location = new System.Drawing.Point(36, 71);
            this.CalendarioTurnos.Name = "CalendarioTurnos";
            this.CalendarioTurnos.TabIndex = 0;
            this.CalendarioTurnos.DateChanged += new System.Windows.Forms.DateRangeEventHandler(this.monthCalendar1_DateChanged);
            // 
            // Selección_de_Día_y_Horario
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(508, 330);
            this.Controls.Add(this.TurnosDisponiblesGB);
            this.MaximizeBox = false;
            this.Name = "Selección_de_Día_y_Horario";
            this.Text = "Selección_de_Día_y_Horario";
            this.TurnosDisponiblesGB.ResumeLayout(false);
            this.TurnosDisponiblesGB.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.TurnosDisponiblesDGW)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox TurnosDisponiblesGB;
        private System.Windows.Forms.DataGridView TurnosDisponiblesDGW;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.MonthCalendar CalendarioTurnos;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button VolverButton;
        private System.Windows.Forms.Button ConfirmarTurnoButton;
    }
}