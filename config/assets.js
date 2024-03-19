import * as assets from "hanami-assets";
import { solidPlugin } from "esbuild-plugin-solid";
import { sassPlugin } from "esbuild-sass-plugin";

await assets.run({
  esbuildOptionsFn: (_args, esbuildOptions) => {
    const plugins = [
      ...esbuildOptions.plugins,
      solidPlugin(),
      sassPlugin({embedded: true})
    ];

    return {
      ...esbuildOptions,
      plugins
    };
  }
});
