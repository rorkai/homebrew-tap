# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.14.2'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.14.2/asc_5.14.2_macOS_arm64'
      sha256 'd763eb914272489b9c2d34893784e57b8e3034920b8a0dfe79622332c91ba9b9'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.14.2/asc_5.14.2_macOS_amd64'
      sha256 'a675c9a6511d893ad944ce5660878927137d73656c312556853a705d5e797b73'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.14.2_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.14.2_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
