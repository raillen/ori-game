#!/usr/bin/env sh
# Umbrella smoke: each ECO package smoke + cross-package integration demos.
set -eu

ORI_BIN="${ORI_BIN:-}"
if [ -z "$ORI_BIN" ]; then
    if command -v ori >/dev/null 2>&1; then
        ORI_BIN=$(command -v ori)
    else
        echo "set ORI_BIN to ori compiler" >&2
        exit 2
    fi
fi
export ORI_BIN
export ORI_USE_SYSTEM_LINKER="${ORI_USE_SYSTEM_LINKER:-1}"

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
game_root=$(CDPATH= cd -- "$script_dir/.." && pwd)
proj_root=$(CDPATH= cd -- "$game_root/.." && pwd)

run_pkg_smoke() {
    name=$1
    dir=$2
    smoke=$3
    echo ""
    echo "======== ECO smoke: $name ========"
    if [ ! -d "$dir" ]; then
        echo "SKIP $name (missing $dir)"
        return 0
    fi
    (CDPATH= cd -- "$dir" && ORI_BIN="$ORI_BIN" sh "$smoke")
}

# Core Linux-5 stack
run_pkg_smoke "ori-raylib" "$proj_root/ori-raylib" "./tools/smoke_linux.sh"
run_pkg_smoke "ori-game" "$game_root" "./tools/smoke_linux.sh"
run_pkg_smoke "ori-box2d" "$proj_root/ori-box2d" "./tools/smoke_linux.sh"
run_pkg_smoke "ori-jolt" "$proj_root/ori-jolt" "./tools/smoke_linux.sh"
run_pkg_smoke "ori-imgui" "$proj_root/ori-imgui" "./tools/smoke_linux.sh"
run_pkg_smoke "ori-raygui" "$proj_root/ori-raygui" "./tools/smoke_linux.sh"
run_pkg_smoke "ori-rres" "$proj_root/ori-rres" "./tools/smoke_linux.sh"
run_pkg_smoke "ori-sqlite" "$proj_root/ori-sqlite" "./tools/smoke_linux.sh"
run_pkg_smoke "ori-enet" "$proj_root/ori-enet" "./tools/smoke_linux.sh"

# High ports (B2.18 alta) — SKIP if directory missing
run_pkg_smoke "ori-freetype" "$proj_root/ori-freetype" "./tools/smoke_linux.sh"
run_pkg_smoke "ori-harfbuzz" "$proj_root/ori-harfbuzz" "./tools/smoke_linux.sh"
run_pkg_smoke "ori-stb" "$proj_root/ori-stb" "./tools/smoke_linux.sh"
run_pkg_smoke "ori-noise" "$proj_root/ori-noise" "./tools/smoke_linux.sh"
run_pkg_smoke "ori-miniz" "$proj_root/ori-miniz" "./tools/smoke_linux.sh"
run_pkg_smoke "ori-nfd" "$proj_root/ori-nfd" "./tools/smoke_linux.sh"
run_pkg_smoke "ori-implot" "$proj_root/ori-implot" "./tools/smoke_linux.sh"
run_pkg_smoke "ori-imnodes" "$proj_root/ori-imnodes" "./tools/smoke_linux.sh"
run_pkg_smoke "ori-imguizmo" "$proj_root/ori-imguizmo" "./tools/smoke_linux.sh"
run_pkg_smoke "ori-tracy" "$proj_root/ori-tracy" "./tools/smoke_linux.sh"
run_pkg_smoke "ori-enkiTS" "$proj_root/ori-enkiTS" "./tools/smoke_linux.sh"

# Medium ports (B2.18 média M1–M6) — SKIP if directory missing
run_pkg_smoke "ori-cgltf" "$proj_root/ori-cgltf" "./tools/smoke_linux.sh"
run_pkg_smoke "ori-fast-obj" "$proj_root/ori-fast-obj" "./tools/smoke_linux.sh"
run_pkg_smoke "ori-physfs" "$proj_root/ori-physfs" "./tools/smoke_linux.sh"
run_pkg_smoke "ori-clay" "$proj_root/ori-clay" "./tools/smoke_linux.sh"
run_pkg_smoke "ori-lz4" "$proj_root/ori-lz4" "./tools/smoke_linux.sh"
run_pkg_smoke "ori-recast" "$proj_root/ori-recast" "./tools/smoke_linux.sh"

echo ""
echo "======== Integration demos ========"
run_pkg_smoke "box2d_visual" "$proj_root/ori-box2d/demos/box2d_visual" "./tools/smoke.sh"
run_pkg_smoke "jolt_boxes_3d" "$proj_root/ori-jolt/demos/jolt_boxes_3d" "./tools/smoke.sh"
run_pkg_smoke "raygui_game" "$proj_root/ori-raygui/demos/raygui_game" "./tools/smoke.sh"
run_pkg_smoke "score_game" "$proj_root/ori-sqlite/demos/score_game" "./tools/smoke.sh"
run_pkg_smoke "imgui_game" "$proj_root/ori-imgui/demos/imgui_game" "./tools/smoke.sh"
run_pkg_smoke "rres_assets" "$game_root/demos/rres_assets" "./tools/smoke.sh"

echo ""
echo "smoke_eco_linux: all green"
