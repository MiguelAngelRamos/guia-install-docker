1. Abre una terminal.
2. Ejecuta el siguiente comando para descargar el script de instalación de nvm:

   ```bash
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
   ```

   (Asegúrate de verificar si hay una versión más reciente en la [página de GitHub de nvm](https://github.com/nvm-sh/nvm)).

3. Después de que se complete la instalación, cierra y vuelve a abrir la terminal, o ejecuta:

   ```bash
   source ~/.bashrc
   ```

4. Para verificar que nvm se ha instalado correctamente, ejecuta:

   ```bash
   nvm --version
   ```

5. Ahora puedes instalar diferentes versiones de Node.js usando:

   ```bash
   nvm install <versión>
   ```

   Por ejemplo, para instalar la última versión LTS:

   ```bash
   nvm install --lts
   ```

6. Para cambiar entre versiones, puedes usar:

   ```bash
   nvm use <versión>
   ```
