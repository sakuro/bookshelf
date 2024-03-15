import * as assets from "hanami-assets";
import { solidPlugin } from "esbuild-plugin-solid";

await assets.run({
  esbuildOptionsFn: (_args, esbuildOptions) => {
    const plugins = [...esbuildOptions.plugins, solidPlugin()];
    return {
      ...esbuildOptions,
      plugins
    };
  }
});
