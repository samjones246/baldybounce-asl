state("Baldy Bounce"){
    bool fadeOutEnabled: "UnityPlayer.dll", 0x1A0E220, 0x48, 0xB0, 0x10, 0x30, 0x30, 0x8, 0x70, 0x50, 0x1A8;
}

startup
{
    vars.Log = (Action<object>)((output) => print("[Baldy Boucne ASL] " + output));
    Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
    vars.Helper.GameName = "Baldy Bounce";
    vars.Helper.LoadSceneManager = true;
}

start
{
    return current.scene == "00_MenuScene" && current.fadeOutEnabled && !old.fadeOutEnabled;
}

update
{
    current.scene = vars.Helper.Scenes.Active.Name;
}

isLoading
{
    return vars.Helper.IsLoading || current.scene.Contains("LoadingScene");
}