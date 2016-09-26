This directory is for applications that have 'bin' directories that you'd like to add to your path. The zshrc will automatically add them when it is run (although it usually requires complletely logging out and logging back in). Just soft link them here, eg:
  ln -s /opt/some/application ~/etc/local/application
