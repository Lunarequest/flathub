cp Mods/MediaPipe/_tracker/Project/requirements.txt addons/KiriPythonRPCWrapper/Wheels
godot --disable-render-loop --no-header --headless --script Build/WriteBuildVars.gd
. Build/build_vars.sh godot --headless --path . --import
godot --headless --path . --export-release "${TARGET}" Build/Builds/snekstudio
install -Dm755 snekstudio-runner.sh ${FLATPAK_DEST}/bin/snekstudio-runner
cd Build/Builds/
install -Dm755 snekstudio -t ${FLATPAK_DEST}/bin/
install -Dm644 snekstudio.pck -t ${FLATPAK_DEST}/bin/
mkdir -p ${FLATPAK_DEST}/share/SnekStudio
cp -r Mods ${FLATPAK_DEST}/share/SnekStudio
cp -r SampleModels ${FLATPAK_DEST}/share/SnekStudio
rm -r ${FLATPAK_DEST}/share/SnekStudio/{logs,objectdb_snapshots}