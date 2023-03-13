state("Baldy Bounce"){}

startup
{
    Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Unity");
    vars.Helper.GameName = "Baldy Bounce";
    vars.Helper.LoadSceneManager = true;
}

update
{
    current.scene = vars.Helper.Scenes.Active.Name;
}

isLoading
{
    return vars.Helper.IsLoading || current.scene.Contains("LoadingScene");
}