import "./style.css";
import * as BABYLON from "@babylonjs/core";

async function main() {
  const canvas = document.getElementById("app") as HTMLCanvasElement;
  const engine = new BABYLON.Engine(canvas, true);

  const scene = new BABYLON.Scene(engine);

  new BABYLON.DirectionalLight("light", new BABYLON.Vector3(0, -1, 0.5), scene);
  new BABYLON.ArcRotateCamera(
    "camera",
    -Math.PI / 2,
    Math.PI / 2.5,
    5,
    BABYLON.Vector3.Zero(),
    scene,
  );

  const box = BABYLON.MeshBuilder.CreateBox("box", {}, scene);
  box.rotation.x = Math.PI / 4;
  box.rotation.z = Math.PI / 4;

  engine.runRenderLoop(() => {
    box.rotation.y += 0.001 * engine.getDeltaTime();
    scene.render();
  });

  window.addEventListener("resize", () => {
    engine.resize();
  });
}

main();
