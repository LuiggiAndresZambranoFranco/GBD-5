/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package terapias;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author Zambrano Franco Luiggi
 */
public class metodo_institucion {

    Connection db = null;
    Statement st = null;
    ResultSet rs = null;
    PreparedStatement pst = null;

    Integer id_institucion;
    String 
            nombre_institucion, 
            correo_institucion,
            telefono_institucion,
            direccion_institucion;
    String 
            sql;
    Boolean 
            a;

 
    public void conecciondb() {
        try {
            db = DriverManager.getConnection("jdbc:postgresql://localhost:5433/centro_terapias", "postgres", "valeria1208");
        } catch (SQLException e) {
            System.out.println("Ocurrio un error : " + e.getMessage());
        }
    }

    public void insertar_institucion() throws SQLException {
        a = false;
        if (a == false) {
            conecciondb();
            id_institucion = Integer.valueOf(institucion.a1.getText());
            nombre_institucion = institucion.a2.getText();
            direccion_institucion = institucion.a3.getText();
            telefono_institucion = institucion.a4.getText();
            correo_institucion = institucion.a5.getText();
            
            sql = "insert into institucion (id_institucion,nombre_institucion,direccion_institucion,telefono_institucion,correo_institucion) values (?,?,?,?,?)";
            pst = db.prepareStatement(sql);
            pst.setInt(1, id_institucion);
            pst.setString(2, nombre_institucion);
            pst.setString(3, direccion_institucion );
            pst.setString(4, telefono_institucion);
            pst.setString(5, correo_institucion);
            pst.executeUpdate();
            JOptionPane.showMessageDialog(null, "Se Guardo...");
        }
    }

    public void actualizar_institucion() throws SQLException {
        if (a == true) {
            conecciondb();
            nombre_institucion = institucion.a2.getText();
            direccion_institucion = institucion.a3.getText();
            telefono_institucion = institucion.a4.getText();
            correo_institucion = institucion.a5.getText();
            
            sql = "update institucion set nombre_institucion=?, direccion_institucion=?, telefono_institucion=?, correo_institucion=? where id_institucion='" + id_institucion + "'";
            pst = db.prepareStatement(sql);
            pst.setString(1, nombre_institucion);
            pst.setString(2, direccion_institucion );
            pst.setString(3, telefono_institucion);
            pst.setString(4, correo_institucion);
            pst.executeUpdate();
            JOptionPane.showMessageDialog(null, "Se Actualizo...");
        }
    }
    
    public void consultar_institucion() throws SQLException {
        conecciondb();st = db.createStatement();
        id_institucion = Integer.valueOf(institucion.a1.getText());
        rs = st.executeQuery("select * from institucion where id_institucion='" + id_institucion + "'");
        if (rs.next()) {
            a = true;
            institucion.a2.setText(rs.getString(2));//nombre
            institucion.a3.setText(rs.getString(3));//direccion 
            institucion.a4.setText(rs.getString(4));//telefono
            institucion.a5.setText(rs.getString(5));//correo

        } else {
            JOptionPane.showMessageDialog(null, "No Existe...");
            a = false;
        }
    }

    public void eliminar_institucion() throws SQLException {
        try {
            if (a == true) {
                conecciondb();
                int resp = JOptionPane.showConfirmDialog(null, "Lo elimina", "ALERTA", JOptionPane.YES_NO_OPTION);
                if (resp != 1) {
                    st.execute("delete from institucion where id_institucion='" + id_institucion + "'");
                    JOptionPane.showMessageDialog(null, "SE ELIMINO, ya que no tiene relación tabla");
                }
            }
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "No se puede eliminar, tiene relación tabla");
        }
    }

    public void limpiar_panel_institucion() {
        institucion.a1.setText("");
        institucion.a2.setText("");
        institucion.a3.setText("");
        institucion.a4.setText("");
        institucion.a5.setText("");
    }

}
