describe Fastlane do
  describe Fastlane::FastFile do
    describe "git_commit" do
      it "generates the correct git command" do
        result = Fastlane::FastFile.new.parse("lane :test do
          git_commit(path: './fastlane/README.md', message: 'message')
        end").runner.execute(:test)

        expect(result).to eq("git commit -m 'message' './fastlane/README.md'")
      end

      it "generates the correct git command with an array of paths" do
        result = Fastlane::FastFile.new.parse("lane :test do
          git_commit(path: ['./fastlane/README.md', './fastlane/LICENSE'], message: 'message')
        end").runner.execute(:test)

        expect(result).to eq("git commit -m 'message' './fastlane/README.md' './fastlane/LICENSE'")
      end
    end
  end
end
